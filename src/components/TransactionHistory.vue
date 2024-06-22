<template>
  <!-- Sección para el historial de transacciones -->
  <section>
    <!-- Título de la sección -->
    <h2>Historial de Transacciones</h2>
    <!-- Tabla para mostrar las transacciones -->
    <table>
      <!-- Encabezado de la tabla con los títulos de las columnas -->
      <thead>
        <tr>
          <th>Tipo</th>
          <th>Monto</th>
          <th>Descripción</th>
          <th>Fecha</th>
        </tr>
      </thead>
      <!-- Cuerpo de la tabla donde se listan las transacciones -->
      <tbody>
        <!-- Iteración sobre cada transacción filtrada para crear una fila en la tabla -->
        <tr v-for="transaction in filteredTransactions" :key="transaction.id">
          <td>{{ transaction.type }}</td>
          <td>{{ transaction.amount }}</td>
          <td>{{ transaction.description }}</td>
          <td>{{ transaction.date }}</td>
        </tr>
      </tbody>
    </table>
  </section>
</template>

<script>
export default {
  name: 'TransactionHistory',
  // Propiedades recibidas del componente padre
  props: {
    transactions: {
      type: Array,
      required: true
    }
  },
  computed: {
    // Propiedad computada para filtrar transacciones de los últimos 30 días
    filteredTransactions() {
      const thirtyDaysAgo = new Date();
      thirtyDaysAgo.setDate(thirtyDaysAgo.getDate() - 30);
      // Retorna solo las transacciones que son más recientes que hace treinta días
      return this.transactions.filter(t => t.date >= thirtyDaysAgo);
    }
  }
}
</script>