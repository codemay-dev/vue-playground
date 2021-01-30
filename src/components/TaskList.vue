<template>
  <div class="row align-items-center justify-content-center">
    <div class="col-12">
      <h2 class="mt-5">Task List</h2>
    </div>
    <div class="col-12" style="max-width: 20rem">
      <p>
        Completed Tasks:
        {{
          tasks.filter((task) => {
            return task.done === true;
          }).length
        }}
      </p>
      <p>
        Pending Tasks:
        {{
          tasks.filter((task) => {
            return task.done === false;
          }).length
        }}
      </p>

      <div class="row row-cols-1 justify-content-center">
        <task
          v-for="(task, index) in tasks"
          v-bind:task="task"
          :key="index"
          v-on:delete-task="deleteTask"
        ></task>
      </div>
    </div>
  </div>
</template>

<script>
import Task from "./Task";

export default {
  props: ["tasks"],
  components: {
    Task,
  },
  methods: {
    deleteTask(task) {
      const taskIndex = this.tasks.indexOf(task);
      this.tasks.splice(taskIndex, 1);
    },
  },
};
</script>

<style lang="scss">
</style>
