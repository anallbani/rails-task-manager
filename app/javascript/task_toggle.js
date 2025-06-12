document.addEventListener("DOMContentLoaded", () => {
  const checkboxes = document.querySelectorAll(".task-toggle");

  function updateProgressBar() {
    const total = checkboxes.length;
    const completed = [...checkboxes].filter(cb => cb.checked).length;
    const percent = total === 0 ? 0 : Math.round((completed / total) * 100);
    const bar = document.querySelector("#progress-bar");
    const label = document.querySelector("#progress-label");
    if (bar && label) {
      bar.style.width = `${percent}%`;
      label.textContent = `${percent}% Complete`;
    }
  }

  checkboxes.forEach(checkbox => {
    checkbox.addEventListener("change", async () => {
      const taskId = checkbox.dataset.id;
      const response = await fetch(`/tasks/${taskId}/toggle`, {
        method: "PATCH",
        headers: {
          "Accept": "application/json",
          "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
        }
      });
      const data = await response.json();
      checkbox.checked = data.completed;
      updateProgressBar();
    });
  });

  updateProgressBar();
});
