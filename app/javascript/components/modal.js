// Add Friends Relation Modal on Dashboard screen
const myFriendModal = document.getElementById('addRelationModal')
const myFriendInput = document.getElementById('test')

myFriendModal.addEventListener('shown.bs.modal', () => {
  myFriendInput.focus()
})

// Add Event Relation Modal on Dashboard screen
const myEventModal = document.getElementById('addEventModal')
const myEVentInput = document.getElementById('test')

myEventModal.addEventListener('shown.bs.modal', () => {
  myEVentInput.focus()
})
