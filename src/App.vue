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
            v-on:click="showTask"
          >
            Task
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

    <task-list v-bind:tasks="tasks" v-show="isTasklist"></task-list>
    <create-task v-on:create-task="addTask" v-show="isTasklist"></create-task>

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
      isOther: false,
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
      this.isOther = false;
    },
    showUsers() {
      this.isTasklist = false;
      this.isUsers = true;
      this.isOther = false;
    },
    showOther() {
      this.isTasklist = false;
      this.isUsers = false;
      this.isOther = true;
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
