// Add Friends Relation Modal on Dashboard screen
const myModal = document.getElementById('addRelation')
const myInput = document.getElementById('test')

myModal.addEventListener('shown.bs.modal', () => {
  myInput.focus()
})
