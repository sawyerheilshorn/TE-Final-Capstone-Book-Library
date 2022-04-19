<template>
  <div>
    <div id="create_reading_list">
      <form v-on:submit.prevent class="homeForm">
        <label  for="reading_list">Add Reading List</label>
        <input
          id="reading_list"
          type="text"
          v-model="readingList.listName"
          required
        />
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
          this.$router.go(this.$router.currentRoute);
        }
        // this.$router.push("dashboard");
      });
    },
  },
};
</script>

<style scoped>
.btn-submit {
  color: white;
  margin-top: 10%  ;
  width: 210px;
  background-color: rgb(203,192,183);
}


form {
  /* margin-left: 47%; */
  color: black;
  
  margin-top: 10%;
}

form input {
  /* margin-left: 46%; */
  width: 210px;
}

button {
  color: white;
}
#create_reading_list{
  
  width: 100%;

}



</style>

