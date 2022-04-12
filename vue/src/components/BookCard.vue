<template>
  <div class="card-deck">
    <div class="card text-center shadow-lg p-3 mb-5 bg-white rounded">
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

.card-deck {
  margin: 0 1em 1em 1em;
  padding: 1em 1em;
  background-color: rgba(219, 176, 148, 0.972);
  border-radius: 2%;
}

.card {
  border-radius: 4px;
  box-shadow: 0 6px 10px rgba(0, 0, 0, 0.08), 0 0 6px rgba(0, 0, 0, 0.05);
  transition: 0.3s transform cubic-bezier(0.155, 1.105, 0.295, 1.12),
    0.3s box-shadow,
    0.3s -webkit-transform cubic-bezier(0.155, 1.105, 0.295, 1.12);
  padding: 14px 80px 18px 36px;
  cursor: pointer;
  width: 18rem;
}
.card:hover {
  transform: scale(1.05);
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.12), 0 4px 8px rgba(0, 0, 0, 0.06);
}

/*.card-img-top{
  height: 50%;
  width: 30%;
}*/
</style>