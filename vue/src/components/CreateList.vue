<template>
  <div>
    <div id="create_reading_list">
      <form v-on:submit.prevent class="homeForm">
        <label for="reading_list">Add Reading List</label>
        <input id="reading_list" type="text" v-model="readingList.listName" />
        <button
          type="submit"
          @click="createReadingList()"
          class="btn btn-submit"
        >
          Submit
        </button>
        <!--button class="btn btn-cancel" type="cancel" v-on:click="cancelForm">Cancel</button-->
      </form>
    </div>
  </div>
</template>

<script>
import ReadingListService from "../services/ReadingListService";

export default {
  name: "create-list",
  data() {
    return {
      readingList: {
        listName: "",
      },
    };
  },
  methods: {
    createReadingList() {
      ReadingListService.createList(this.readingList).then((response) => {
        if (response.status === 200) {
          console.log(response);
        }
        this.$router.push("dashboard");
      });
    },
  },
};
</script>

<style scoped>
form {
  /* margin-left: 47%; */
  color: white;
  text-align: center;
  margin-top: 10%;
}

form input {
  margin-left: 46%;
}

form label {
}

button {
  color: white;
}
</style>