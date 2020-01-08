document.addEventListener("DOMContentLoaded", function() {


  const candidateList = document.querySelector('#candidate_list');
  // const refreshButton = document.getElementById('refresh');
  // const refreshButton = document.createElement('button');
  // refreshButton.innerText =  'Refresh';

  const refreshButton = document.querySelector('.refresh');
  refresh.addEventListener('click', function() {
  location.reload();
  });

  axios.get('https://bb-election-api.herokuapp.com/')
    .then((response) => {

      response.data.candidates.forEach((candidate) => {

        let individual = document.createElement('li');
        individual.innerText = 'Name: ' + candidate.name + '\nVotes: '  + candidate.votes;
        candidateList.appendChild(individual);

        const form = document.createElement('form');
        form.method = 'POST';
        form.action = 'https://bb-election-api.herokuapp.com/vote';

        const hidden = document.createElement('input');
        const submitButton = document.createElement('button');
        submitButton.innerText = `Vote for ${candidate.name}!`
        hidden.type = 'hidden';
        hidden.name = 'name';
        hidden.value = candidate.name
        form.appendChild(hidden);
        form.appendChild(submitButton);
        individual.appendChild(form);

      });

    });

})


document.addEventListener('submit', function(event) {

  event.preventDefault();

  let name = event.target.querySelector('input[type=hidden]').value;
  // console.log(name);
  axios.post('https://bb-election-api.herokuapp.com/vote',{'name': name})
  // axios({method: 'post',url: 'https://bb-election-api.herokuapp.com/vote',data: { 'name': name }})
  .then(function(response) {
  console.log(response);


}).catch(function(response) {
  console.log('Request Failed');

}).then(function(rsponse){
  console.log("Show it anyway!!");
})

});
