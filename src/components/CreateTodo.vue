<template>
  <div class="row align-items-center justify-content-center">
    <div class="col-12" style="max-width: 20rem">
      <button
        class="btn btn-success"
        v-on:click="openForm"
        v-show="!isCreating"
      >
        Add Todo
      </button>
      <div class="col mb-4" v-show="isCreating">
        <div class="card h-100">
          <div class="card-body">
            <div class="mb-3 text-start">
              <label class="form-label">Title</label>
              <input
                class="form-control"
                type="text"
                v-model="titleText"
                ref="title"
                defaultValue=""
              />
            </div>
            <div class="mb-3 text-start">
              <label class="form-label">Project</label>
              <input
                class="form-control"
                type="text"
                v-model="projectText"
                ref="project"
                defaultValue=""
              />
            </div>
          </div>
          <div class="card-footer">
            <button class="btn btn-primary mx-1" v-on:click="sendForm()">
              Create
            </button>
            <button class="btn btn-danger mx-1" v-on:click="closeForm">
              Cancel
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      titleText: "",
      projectText: "",
      isCreating: false,
    };
  },
  methods: {
    openForm() {
      this.isCreating = true;
    },
    closeForm() {
      this.isCreating = false;
    },
    sendForm() {
      if (this.titleText.length > 0 && this.projectText.length > 0) {
        const title = this.titleText;
        const project = this.projectText;
        this.$emit("create-todo", {
          title,
          project,
          done: false,
        });
      }
      this.isCreating = false;
    },
  },
};
</script>

<style>
</style>