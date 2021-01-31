<template>
  <div id="app" class="container-fluid">
    <header class="row align-items-center justify-content-center mt-5">
      <div class="col-12">
        <h1>My Vue.js Playground</h1>
      </div>
    </header>

    <div class="row align-items-center justify-content-center my-2">
      <div class="col-12">
        <div class="btn-group" role="group" aria-label="Basic outlined example">
          <button
            type="button"
            class="btn btn-outline-primary"
            v-on:click="showTask"
          >
            Tasks
          </button>
          <button
            type="button"
            class="btn btn-outline-primary"
            v-on:click="showUsers"
          >
            Users
          </button>
          <button type="button" class="btn btn-outline-primary" v-on:click="showNothing">
            Nothing Yet
          </button>
        </div>
      </div>
    </div>

    <task-list v-bind:tasks="tasks" v-show="isTasklist"></task-list>
    <create-task v-on:create-task="addTask" v-show="isTasklist"></create-task>

    <Users v-show="isUsers" />

    <footer class="row mt-5 pt-3">
      <div class="col-12">
        <p><a href="https://jaimemay.com" target="_new">Website</a> | <a href="https://github.com/codemay-dev" target="_new">Github</a> | <a href="https://www.linkedin.com/in/jaimemay/" target="_new">LinkedIn</a></p>
      </div>
    </footer>
  </div>
</template>

<script>
import Users from "./components/Users.vue";
import TaskList from "./components/TaskList";
import CreateTask from "./components/CreateTask";

export default {
  name: "SampleApp",
  components: {
    Users,
    TaskList,
    CreateTask,
  },
  data() {
    return {
      isTasklist: true,
      isUsers: false,
      isNothing: false,
      tasks: [
        {
          title: "Task A",
          project: "Project A",
          done: false,
        },
        {
          title: "Task B",
          project: "Project B",
          done: true,
        },
        {
          title: "Task C",
          project: "Project C",
          done: false,
        },
        {
          title: "Task D",
          project: "Project D",
          done: false,
        },
      ],
    };
  },
  methods: {
    showTask() {
      this.isTasklist = true;
      this.isUsers = false;
      this.isNothing = false;
    },
    showUsers() {
      this.isTasklist = false;
      this.isUsers = true;
      this.isNothing = false;
    },
    showNothing() {
      this.isTasklist = false;
      this.isUsers = false;
      this.isNothing = true;
    },
    addTask(title) {
      this.tasks.push({
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
