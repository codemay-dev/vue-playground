<template>
  <div id="app" class="container-fluid">
    <header class="row align-items-center justify-content-center">
      <div class="col-12">
        <h1>My Fun VueJS Playground</h1>
      </div>
    </header>

    <todo-list v-bind:todos="todos"></todo-list>

    <!-- <Users /> -->
  </div>
</template>

<script>
// import Users from "./components/Users.vue";
import TodoList from "./components/TodoList";

export default {
  name: "SampleApp",
  components: {
    // Users,
    TodoList,
  },
  data() {
    return {
      todos: [
        {
          title: "Todo A",
          project: "Project A",
          done: false,
        },
        {
          title: "Todo B",
          project: "Project B",
          done: true,
        },
        {
          title: "Todo C",
          project: "Project C",
          done: false,
        },
        {
          title: "Todo D",
          project: "Project D",
          done: false,
        },
      ],
    };
  },
};
</script>

<style lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;

  header {
    margin: 5rem 0;
  }
}
</style>
