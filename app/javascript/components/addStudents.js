function addStudents() {
  const studentForm = document.querySelector(".single-input");
  const plusSign = document.querySelector(".input-add");
  const studentHeading = document.querySelector(".add-student-heading");
  // const divClass = "single-input text-center";
  // const userName = "Student Name";
  // const userEmail = "Student Email";
  // const userPassword = "Student Password";
  // const url = "https://res.cloudinary.com/dm37aktki/image/upload/v1657545279/Depositphotos_13203627_S_uydpbw.png";
  // const html = `<div class=${divClass}>
  //         <%= f.input :username, :label => ${userName} %>
  //         <%= f.input :email, :label => ${userEmail} %>
  //         <%= f.input :password, :label => ${userPassword} %>
  //         <div class='input-add'>
  //           <%= image_tag(${url})  %>
  //         </div>
  //       </div>`;

  plusSign.addEventListener("click", () => {
    studentHeading.insertAdjacentElement('afterend', studentForm.cloneNode(true));
  });
};

export {addStudents};
