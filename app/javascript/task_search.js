document.addEventListener("DOMContentLoaded", () => {
  const searchInput = document.querySelector("#task-search");

  if (searchInput) {
    searchInput.addEventListener("input", () => {
      const filter = searchInput.value.toLowerCase();
      document.querySelectorAll(".task-item").forEach(task => {
        const title = task.dataset.title.toLowerCase();
        task.style.display = title.includes(filter) ? "" : "none";
      });
    });
  }
});
