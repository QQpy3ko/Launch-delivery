<template>
  <div>
      <h3 v-if="this.menu_date == '' || this.menu_date == new Date().toJSON().slice(0,10)">Today's Menu</h3>
      <h3 v-else>Menu for {{ this.menu_date }}</h3>
    <b-row align-v="start">
      <b-col>
        <details open>
          <p>
          <summary>Show/hide order section</summary>
          <p>
            Choose three items: one of the first courses, one of the second courses, and one of the drinks.
          <p>
            Selected positions:
              <li v-for="menu_position of showSelected">{{ menu_position  }}$</li>
          <p v-if="orderTotal">
            Order total: {{ orderTotal + '$' }}
          </p>
          <p>
            <b-button size="sm" @click="clearSelected">Clear selection</b-button>
          </p>
          <p>
            <b-button size="sm" variant="success" @click="createOrder">Confirm order</b-button>
          </p>
        </details>
      </b-col>

      <b-col align-h="end">
        <div>
          <Datepicker
            @EmitDateFromDatepicker="useDateFromDatepicker($event)"
          />
        </div>
      </b-col>
    </b-row>

    <div class="text-danger" v-if="error">{{ error }}</div>
    <div class="text-success" v-if="orderSuccessMessage">{{ orderSuccessMessage.message_text }}</div>
    <br>
    <b-table
      ref="selectableTable"
      selectable
      :select-mode="selectMode"
      :items="items"
      :fields="fields"
      @row-selected="onRowSelected"
      responsive="sm"
      :sort-by.sync="sortBy"
      :sort-desc.sync="sortDesc"
    >
      <template v-slot:cell(selected)="{ rowSelected }">
        <template v-if="rowSelected">
          <span aria-hidden="true">&check;</span>
          <span class="sr-only">Selected</span>
        </template>
        <template v-else>
          <span aria-hidden="true">&nbsp;</span>
          <span class="sr-only">Not selected</span>
        </template>
      </template>
      <template v-slot:cell(photo_url)="data">
        <img :src="data.item.photo_url" width="200" height="150">
      </template>
      <template v-slot:cell(category_id)="data">
        <template v-if="data.item.category_id === 1">
          First Course
        </template>
       <template v-if="data.item.category_id === 2">
          Second Course
        </template>
        <template v-if="data.item.category_id === 3">
          Drinks
        </template>
      </template>
    </b-table>
  </div>
</template>

<script>
import axios from "axios";
import Datepicker from "./Datepicker.vue";

export default {
  data() {
    return {
      fields: [{ key: 'photo_url', label: '' },
                'title',
                { key: 'category_id', label: 'Category', sortable: true },
                { key: 'history_price', label: 'Cost, $'},
                { key: 'selected'}], // last index is used for hide-show 'selected' column
      menu_date: '',
      items: [],
      sortBy: 'category_id',
      sortDesc: false,
      selectMode: 'multi',
      selected: [],
      showSelected: [],
      orderTotal: '',
      orderValidity: false,
      orderSuccessMessage: '',
      error: '',
    }
  },
  components: {
    Datepicker
  },
  methods: {
    fetchMenu (date) {
      return axios
        .get(`/api/v1/launch_menu/${date}`)
        .then(response => {
          console.log(response.data);
          this.items = response.data;
        })
        .catch(error => { this.setError(error, 'Error! Something went wrong')
        });
    },
    onRowSelected(items) {
        this.selected = items;
        this.showSelected = this.selected.map(element => `${element.title} - ${element.price}`);
        this.orderTotal = this.selected.reduce((a, element)  =>  a + Number(element.price), 0).toFixed(2)
        this.IsOrderValid(this.selected)
      },
    clearSelected() {
      this.$refs.selectableTable.clearSelected()
    },
    IsOrderValid(array_of_selected) {
      let categories_list = array_of_selected.map(element => element.category_id)
      if (categories_list.length === new Set(categories_list).size && Object.keys(array_of_selected).length === 3 ) {
      this.orderValidity = true;
      } else { this.orderValidity = false;
      }
    },
    createOrder() {
      this.orderSuccessMessage = ''
      this.error = ''
      if (this.orderValidity === true) {
        axios
          .post("/api/v1/orders", {
            order: {menu_item_ids: this.selected.map(element => element.id),
            total: this.orderTotal}
          })
          .then(response => {
            this.orderSuccessMessage = response.data
            this.clearSelected()
          })
          .catch(error => { this.setError(error, 'Error! Something went wrong')
          });
      } else {
        this.error = 'Please choose 3 items from different courses'
      }
    },
    useDateFromDatepicker(date) {
      if (date !== new Date().toJSON().slice(0,10)) {
        this.fields[this.fields.length - 1].thClass = 'd-none';
        this.fields[this.fields.length - 1].tdClass = 'd-none';
        this.clearSelected();
      } else {
        this.fields[this.fields.length - 1].thClass = 'table-cell';
        this.fields[this.fields.length - 1].tdClass = 'table-cell';
      }
      this.menu_date = date;
      this.fetchMenu(date);
    },
    setError(error, text) {
      this.error = (error.response && error.response.data && error.response.data.error) || text
    },
  },

  created() {
    this.fetchMenu(this.menu_date)
  }
}
</script>

<style scoped>
h3 {
  text-align: center;
}
summary {
  border-radius: 5px;
  display: inline;
  padding: 8px 10px;
  background: -webkit-linear-gradient(top, #f3f3f3 50%, #e6e6e6 50%);
}
</style>
