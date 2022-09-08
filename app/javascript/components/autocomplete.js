import autocomplete from 'js-autocomplete';

const autocompleteSearch = () => {
  const users = JSON.parse(document.getElementById('search-data').dataset.users)
  const searchInput = document.getElementById('user_friend_user');

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