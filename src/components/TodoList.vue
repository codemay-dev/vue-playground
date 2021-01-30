<template>
  <div class="row align-items-center justify-content-start">
    <div class="col-12">
      <p>
        Completed Tasks:
        {{
          todos.filter((todo) => {
            return todo.done === true;
          }).length
        }}
      </p>
      <p>
        Pending Tasks:
        {{
          todos.filter((todo) => {
            return todo.done === false;
          }).length
        }}
      </p>

      <div class="row row-cols-1 row-cols-md-2 row-cols-xl-4">
        <todo
          v-for="(todo, index) in todos"
          v-bind:todo="todo"
          :key="index"
          v-on:delete-todo="deleteTodo"
        ></todo>
      </div>
    </div>
  </div>
</template>

<script>
import Todo from "./Todo";

export default {
  props: ["todos"],
  components: {
    Todo,
  },
  methods: {
    deleteTodo(todo) {
      const todoIndex = this.todos.indexOf(todo);
      this.todos.splice(todoIndex, 1);
    },
  },
};
</script>

<style lang="scss">
ul {
  display: inline-block;
}
</style>
