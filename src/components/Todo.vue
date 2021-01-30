<template>
  <div class="col mb-4">
    <div class="card h-100" v-bind:class="{ 'border-success': todo.done }">
      <!-- Show when not in editing mode -->
      <div class="card-body" v-show="!isEditing">
        <h5 class="card-title">{{ todo.title }}</h5>
        <p class="card-text">{{ todo.project }}</p>
        <button class="btn btn-warning btn-sm mx-1" v-on:click="showForm">
          Edit
        </button>
        <button
          class="btn btn-danger btn-sm mx-1"
          v-on:click="deleteTodo(todo)"
        >
          Delete
        </button>
      </div>

      <!-- Show when in editing mode -->
      <div class="card-body" v-show="isEditing">
        <div class="mb-3 text-start">
          <label class="form-label">Title</label>
          <input class="form-control" type="text" v-model="todo.title" />
        </div>
        <div class="mb-3 text-start">
          <label class="form-label">Project</label>
          <input class="form-control" type="text" v-model="todo.project" />
        </div>
      </div>

      <div class="card-footer">
        <button
          class="btn btn-primary"
          v-show="isEditing"
          v-on:click="hideForm"
        >
          Close
        </button>
        <button
          class="btn btn-success mx-1"
          v-show="!isEditing && todo.done"
          disabled
        >
          Completed
        </button>
        <button class="btn btn-info mx-1" v-show="!isEditing && !todo.done">
          Pending
        </button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ["todo"],
  data() {
    return {
      isEditing: false,
    };
  },
  methods: {
    showForm() {
      this.isEditing = true;
    },
    hideForm() {
      this.isEditing = false;
    },
    deleteTodo(todo) {
      this.$emit("delete-todo", todo);
    },
  },
};
</script>

<style lang="scss">
</style>
