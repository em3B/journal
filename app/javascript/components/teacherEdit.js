function editSubjects() {
  const seeSubjects = document.querySelector('.see-subjects');
  const editButton = document.querySelector('.edit-subjects');
  const mainHeading = document.querySelector('.instructions');
  const editHome = document.querySelector('.teacher-btn-edit');

  editButton.addEventListener("click", function() {
    seeSubjects.classList.add("invisible");
    editButton.classList.add("invisible");
    mainHeading.innerHTML = "What would you like to do with your subjects or students?";
    editHome.classList.remove("invisible");
  })
};

export {editSubjects};
