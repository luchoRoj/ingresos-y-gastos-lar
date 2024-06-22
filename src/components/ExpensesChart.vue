<template>
  <!-- Sección para la gráfica de gastos -->
  <section>
    <!-- Título de la sección -->
    <h2>Gráfica de Gastos</h2>
    <!-- Canvas donde se renderizará la gráfica -->
    <canvas id="expensesChart"></canvas>
  </section>
</template>

<script>
import Chart from 'chart.js/auto'

export default {
  name: 'ExpensesChart',
  // Propiedades recibidas del componente padre
  props: {
    transactions: {
      type: Array,
      required: true
    }
  },
  // Hook cuando el componente es montado
  mounted() {
    this.generateChart()
  },
  // Observador para las transacciones
  watch: {
    transactions: {
      handler(newTransactions) {
        this.generateChart(newTransactions) // Actualizar gráfica al cambiar las transacciones
      },
      deep: true // Comparación profunda para cambios en objetos
    }
  },
  methods: {
    // Método para generar la gráfica
    generateChart(transactions = this.transactions) {
      const ctx = document.getElementById('expensesChart').getContext('2d')
      const expenses = transactions.map(t => t.amount)
      const labels = transactions.map(t => {
        // Formateo de fecha según sea necesario (por ejemplo, usando moment.js)
        return new Date(t.date).toLocaleDateString() // Formateo básico de fecha
      })

      // Verificar si ya existe una gráfica y actualizarla si es necesario
      const existingChart = Chart.getChart('expensesChart')
      if (existingChart) {
        existingChart.data.labels = labels
        existingChart.data.datasets[0].data = expenses
        existingChart.update() // Actualizar datos de la gráfica existente
      } else {
        // Crear una nueva gráfica si no existe una previa
        new Chart(ctx, {
          type: 'line',
          data: {
            labels,
            datasets: [{
              label: 'Gastos (Negativo) - Ingresos (Positivo)', // Diferenciar datos
              data: expenses.map(amount => (amount < 0) ? -amount : amount), // Diferenciar gastos/ingresos
              backgroundColor: 'rgba(255, 99, 132, 0.2)',
              borderColor: 'rgba(255, 99, 132, 1)',
              borderWidth: 1
            }]
          },
          options: {
            scales: {
              yAxes: [{
                ticks: {
                  suggestedMin: 0, // Establecer mínimo sugerido a 0
                }
              }],
              xAxes: [{
                // Añadir opciones del eje X si es necesario (por ejemplo, para formateo de fecha)
              }]
            }
          }
        })
      }
    }
  }
}
</script>