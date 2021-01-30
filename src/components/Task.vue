<template>
  <div class="col mb-4">
    <div class="card" v-bind:class="{ 'border-success': task.done }">
      <!-- Show when not in editing mode -->
      <div class="card-body" v-show="!isEditing">
        <h5 class="card-title">{{ task.title }}</h5>
        <p class="card-text">{{ task.project }}</p>
        <button
          class="btn btn-warning btn-sm mx-1"
          v-show="!task.done"
          v-on:click="showForm"
        >
          Edit
        </button>
        <button
          class="btn btn-danger btn-sm mx-1"
          v-show="!task.done"
          v-on:click="deleteTask(task)"
        >
          Delete
        </button>
      </div>

      <!-- Show when in editing mode -->
      <div class="card-body" v-show="isEditing">
        <div class="mb-3 text-start">
          <label class="form-label">Title</label>
          <input class="form-control" type="text" v-model="task.title" />
        </div>
        <div class="mb-3 text-start">
          <label class="form-label">Project</label>
          <input class="form-control" type="text" v-model="task.project" />
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
          class="btn btn-outline-success mx-1"
          v-show="!isEditing && task.done"
          disabled
        >
          Completed
        </button>
        <button
          class="btn btn-outline-danger mx-1"
          v-show="!isEditing && !task.done"
        >
          Pending
        </button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ["task"],
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
    deleteTask(task) {
      this.$emit("delete-task", task);
    },
  },
};
</script>

<style lang="scss">
</style>
