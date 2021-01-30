<template>
  <div id="app" class="container-fluid">
    <header class="row align-items-center justify-content-center mt-5">
      <div class="col-12">
        <h1>My Fun VueJS Playground</h1>
      </div>
    </header>

    <div class="row align-items-center justify-content-center my-2">
      <div class="col-12">
        <div class="btn-group" role="group" aria-label="Basic outlined example">
          <button
            type="button"
            class="btn btn-outline-primary"
            v-on:click="showTodo"
          >
            Todo
          </button>
          <button
            type="button"
            class="btn btn-outline-primary"
            v-on:click="showUsers"
          >
            Users
          </button>
          <button type="button" class="btn btn-outline-primary">
            Something Else
          </button>
        </div>
      </div>
    </div>

    <todo-list v-bind:todos="todos" v-show="isTodolist"></todo-list>
    <create-todo v-on:create-todo="addTodo" v-show="isTodolist"></create-todo>

    <Users v-show="isUsers" />

    <footer class="row mt-5 pt-3">
      <div class="col-12">
        <p>Website | Github | LinkedIn | Twitter</p>
      </div>
    </footer>
  </div>
</template>

<script>
import Users from "./components/Users.vue";
import TodoList from "./components/TodoList";
import CreateTodo from "./components/CreateTodo";

export default {
  name: "SampleApp",
  components: {
    Users,
    TodoList,
    CreateTodo,
  },
  data() {
    return {
      isTodolist: true,
      isUsers: false,
      isOther: false,
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
  methods: {
    showTodo() {
      this.isTodolist = true;
      this.isUsers = false;
      this.isOther = false;
    },
    showUsers() {
      this.isTodolist = false;
      this.isUsers = true;
      this.isOther = false;
    },
    showOther() {
      this.isTodolist = false;
      this.isUsers = false;
      this.isOther = true;
    },
    addTodo(title) {
      this.todos.push({
        title: title.title,
        project: title.project,
        done: false,
      });
    },
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

  footer {
    border-top: 1px solid #ccc;
  }
}
</style>
