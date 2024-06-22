<template>
  <!-- Sección para el formulario de registro de transacciones -->
  <section>
    <!-- Título de la sección -->
    <h2>Registro de Transacciones</h2>
    <!-- Formulario para ingresar datos de una nueva transacción -->
    <form @submit.prevent="submitForm">
      <!-- Campo de selección para el tipo de transacción -->
      <label for="type">Tipo:</label>
      <select id="type" v-model="newTransaction.type">
        <option value="ingreso">Ingreso</option>
        <option value="gasto">Gasto</option>
      </select>

      <!-- Campo numérico para el monto de la transacción -->
      <label for="amount">Monto:</label>
      <input type="number" id="amount" v-model.number="newTransaction.amount" required>

      <!-- Campo de texto para la descripción de la transacción -->
      <label for="description">Descripción:</label>
      <input type="text" id="description" v-model="newTransaction.description" required>

      <!-- Campo de fecha para la fecha de la transacción -->
      <label for="date">Fecha:</label>
      <input type="date" id="date" v-model="newTransaction.date" required>
      
      <!-- Botón para enviar el formulario -->
      <button type="submit">Agregar</button>
    </form>
  </section>
</template>

<script>
export default {
  name: 'TransactionForm',
  data() {
    return {
      // Objeto para almacenar los datos de la nueva transacción
      newTransaction: {
        type: 'ingreso', // Tipo por defecto
        amount: null, // Monto inicial nulo
        description: '', // Descripción inicial vacía
        date: '' // Fecha inicial vacía
      }
    }
  },
  methods: {
    // Método para procesar el envío del formulario
    submitForm() {
      // Creación del objeto transacción con un ID único basado en la hora actual
      const transaction = {
        id: Date.now(),
        type: this.newTransaction.type,
        amount: this.newTransaction.amount,
        description: this.newTransaction.description,
        date: this.newTransaction.date
      }
      // Emisión del evento 'add-transaction' con la nueva transacción como payload
      this.$emit('add-transaction', transaction)
      // Reinicio de los valores del formulario después del envío
      this.newTransaction.amount = null
      this.newTransaction.description = ''
      this.newTransaction.date = ''
    }
  }
}
</script>