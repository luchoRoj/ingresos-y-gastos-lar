<template>
  <!-- Contenedor principal de la aplicación Vue -->
  <div id="app">
    <!-- Cabecera de la aplicación con título e instrucciones -->
    <header>
      <h1>Gestor de Finanzas Personales</h1>
      <a>Con esta app podrás registrar ingresos como positivo (sin signo) y gastos como negativos (signo "-").</a>
      <a>Si ubicas el cursor en los puntos de cambio de la gráfica podrás ver el valor; y por el signo, el tipo de transacción </a>
    </header>

    <!-- Sección principal que contiene los componentes de formulario, historial y gráfico -->
    <main>
      <!-- Componente de formulario para añadir transacciones -->
      <TransactionForm @add-transaction="addTransaction" />
      <!-- Componente de historial para mostrar las transacciones registradas -->
      <TransactionHistory :transactions="transactions" />
      <!-- Componente de gráfico para visualizar los gastos -->
      <ExpensesChart :transactions="transactions" />
    </main>

    <!-- Pie de página con derechos de autor -->
    <footer>
      <p>&copy; 2024 Gestor de Finanzas Personales</p>
    </footer>
  </div>
</template>

<script>
// Importación de componentes necesarios
import TransactionForm from './components/TransactionForm.vue'
import TransactionHistory from './components/TransactionHistory.vue'
import ExpensesChart from './components/ExpensesChart.vue'

export default {
  name: 'App',
  // Registro de componentes utilizados en este archivo
  components: {
    TransactionForm,
    TransactionHistory,
    ExpensesChart
  },
  data() {
    return {
      // Array para almacenar las transacciones registradas
      transactions: []
    }
  },
  methods: {
    // Método para añadir una nueva transacción al array 'transactions'
    addTransaction(transaction) {
      this.transactions.push(transaction)
    }
  }
}
</script>

<style>
/* Estilos globales para la aplicación */
#app {
  display: flex;
  flex-direction: column;
  align-items: center;
}

/* Media queries para adaptar estilos en pantallas pequeñas */
@media (max-width: 600px) {
  header, footer {
    text-align: center;
  }

  main {
    padding: 10px;
  }
}
</style>