import autocomplete from 'js-autocomplete';

const autocompleteSearch = () => {
  let users;
  let searchInput;
  if (document.getElementById('search-data')) {
    users = JSON.parse(document.getElementById('search-data').dataset.users);
    searchInput = document.getElementById('user_friend_user');
  } else {
    console.log("found search data")
    users = false;
    searchInput = false;
    console.log(users)
  }

  if (users && searchInput) {
    new autocomplete({
      selector: searchInput,
      minChars: 1,
      source: function(term, suggest){
          term = term.toLowerCase();
          const choices = users;
          const matches = [];
          for (let i = 0; i < choices.length; i++)
              if (~choices[i].toLowerCase().indexOf(term)) matches.push(choices[i]);
          suggest(matches);
      },
    });
  }
};

export { autocompleteSearch };
