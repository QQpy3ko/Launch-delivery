<template>
  <div>
    <label for="datepicker" >Menu for past dates:</label>
    <b-form-datepicker id="datepicker" :min="min" :max="max" locale="en" v-model="value" class="mb-2" @input="emitDateToParent"></b-form-datepicker>
  </div>
</template>

<script>
export default {
  data() {
    const today = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate())
    const minDate = new Date(today)
    minDate.setMonth(minDate.getMonth() - 1)
    return {
      value: '',
      min: minDate,
      max: today
    }
  },
  methods: {
    emitDateToParent() {
      this.$emit('EmitDateFromDatepicker', this.value)
    }
  }
}
</script>
