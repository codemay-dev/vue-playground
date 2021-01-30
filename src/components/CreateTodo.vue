<template>
  <div class="col-12">
    <button class="btn btn-success" v-on:click="openForm" v-show="!isCreating">
      Add Todo
    </button>
    <div class="col mb-4">
      <div class="card h-100">
        <div class="card-body" v-show="isCreating">
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
</template>

<script>
</script>

<style>
</style>