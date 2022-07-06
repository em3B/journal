function assignClass() {
  const yes = document.querySelector("#one");
  const question = document.querySelector(".yes-no");
  const addClass = document.querySelector(".question-heading");
  const addSubjects = document.querySelector(".select-subjects");

  yes.addEventListener("click", function() {
    jQuery(question).fadeOut("slow");
    addClass.innerHTML = "Select subjects for this class:";
    addSubjects.classList.remove("invisible");
  })

};

export {assignClass};
