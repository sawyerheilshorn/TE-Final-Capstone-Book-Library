<template>
 
    <div class="card-deck">
      <div class="card text-center">
        <img
          v-if="book.isbn"
          v-bind:src="
            'http://covers.openlibrary.org/b/isbn/' + book.isbn + '-M.jpg'
          "
          class="card-img-top"
          alt="#"
        />
        <div class="card-body">
          <h5 class="card-title">{{ book.title }}</h5>
          <h6>{{ "By " + book.author }}</h6>
          <p
            id="inline"
            v-for="genre in book.genreList"
            v-bind:key="genre.id"
            class="card-text"
          >
            {{ genre.genre_name }}
          </p>
        </div>
      </div>
    </div>
</template>

<script>
export default {
  name: "book-card",
  props: {
    book: Object,
  },
};
</script>

<style scoped >
#inline {
  display: inline;
}



/*.card-img-top{
  height: 50%;
  width: 30%;
}*/

</style>