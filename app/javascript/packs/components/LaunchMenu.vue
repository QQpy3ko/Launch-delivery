<template>
  <div>
    <h3>
      Today's Menu
    </h3>
    <p>
      Choose three items: one of the first courses, one of the second courses, and one of the drinks.
    <p>
      Selected positions:
        <li v-for="menu_position of selectedItems">{{ menu_position  }}$</li>
    <p>
      Order total: {{ orderTotal }}
    </p>
    <p>
      <b-button size="sm" @click="clearSelected">Clear selection</b-button>
    </p>
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

export default {
  data() {
    return {
      sortBy: 'category_id',
      sortDesc: false,
      fields: [{ key: 'photo_url', label: '' },
                'title',
                { key: 'category_id', label: 'Category', sortable: true },
                { key: 'price', label: 'Cost, $'},
                'selected'],
      items: [],
      selectMode: 'multi',
      selected: [],
      selectedItems: [],
      orderTotal: '',
      orderValidity: false
    }
  },
  created() {
    return axios
      .get("/api/v1/launch_menu")
      .then(response => {
        console.log(response.data);
        this.items = response.data;
      })
      .catch(e => {
        console.log(e);
      });
  },
  methods: {
    IsOrderValid(array_of_selected) {
      let categories_list = array_of_selected.map(element => element.category_id)
      if (categories_list.length === new Set(categories_list).size && Object.keys(array_of_selected).length === 3 ) {
      this.orderValidity = true;
      } else { this.orderValidity = false;
      }
    },
    onRowSelected(items) {
        this.selected = items;
        this.selectedItems = this.selected.map(element => `${element.title} - ${element.price}`);
        this.orderTotal = String((this.selected.reduce((a, element)  =>  a + Number(element.price), 0)).toFixed(2))+'$'
        this.IsOrderValid(this.selected)
      },
    clearSelected() {
      this.$refs.selectableTable.clearSelected()
    }
  }
}
</script>

<style scoped>
h3 {
  text-align: center;
}
</style>