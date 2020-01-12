1. Select the element that contains the profile image (hint: look for the class). Change the src attribute so it points to a picture of your choosing instead.

var profileImage = document.querySelector('.profile-image');
profileImage.src = "https://placebear.com/200/300";

1. Use the same approach to select the element that contains the photo of the sky and change the src attribute to another picture URL of your choosing.

var skyImage = document.querySelector('.photography');
skyImage.src = "https://placebear.com/200/300";


2. Select the heading that says "Panda the Bear" and change it to your own name.

var header = document.querySelector('section');
var title = header.querySelector('.highlight');
title.innerText = "Farjana Nipa";

3. Select the heading that says "Employment" and change it to something else. (hint: use a descendant selector)

 var employment = document.querySelector('div #employment');
 var title = employment.querySelector('.info-title');
 title.innerText = "Hello";

 4. Change the colour of the body.

var body = document.body;
body.style.backgroundColor = 'red';


5. Change the colour of each element using the highlight class. Use a for loop to do this.

<!-- var highlight = document.querySelectorAll('.highlight');
for (var i = 0; i <= highlight.length; i++) { item = highlight[i]; item.style.color = "red"; } -->

var highlight = document.getElementsByClassName("highlight");

for (var i = 0; i < highlight.length; i++) { current = highlight[i]; current.style.color = "blue"; }

6. Change the font family of the h1 to 'monospace'.

var h1 = document.querySelector('h1');
h1.style.fontFamily = "monospace";


7. Find a way to select the round icons in the sidebar and then change their colour.

var round = document.querySelector('.action-container');
round.style.backgroundColor = "red";


8. Scroll down to the contact form. Change the placeholder attribute of the name field to "identify yourself".

var form = document.querySelector('form');
var input = form.querySelector('#name');
input.placeholder = "identify yourself";

9. Change the placeholder attribute of the message field to "state your business".

var form = document.querySelector('form');
var message = form.querySelector('#message');
message.placeholder = "state your business";


10. Give the name field a "value" attribute of "your nemesis".

var form = document.querySelector('form');
var input = form.querySelector('#name');
input.value = "your nemesis";

11. Change the value attribute of the email field to "koalathebear@gmail.com".

var email = form.querySelector('#email');
email.placeholder = "koalathebear@gmail.com";

12. Change the value of the submit button on the contact form to "En garde!".

var submit = form.querySelector('#submit');
submit.value = "En garde!";

13. We should stop Koala from sending an email to Panda that they might regret! Find a way to disable the submit button (hint: familiarize yourself with the disabled attribute).

submit.disabled = true;

14. We should help Panda protect their privacy by erasing their personal details from the sidebar.

var aside = document.querySelector('aside');
var info = aside.querySelector('.bio-info');
aside.removeChild(info);

SECOND PART :

1. Panda the Bear is lying about their skills! Take the "time travel" skill off the page to satisfy your personal sense of justice. Use your googling and docs-skimming skillz to find a function that will allow you to remove elements from the DOM. (hint: there are multiple ways of doing this, but parentNode might be useful when it comes to selecting the right element)


var div = document.querySelector('#time-travel');
var title = div.querySelector('.bar-title');
div.removeChild(title)

<!-- var timeTravelDiv = document.querySelector('div#time-travel');
timeTravelDiv.parentNode.parentNode.removeChild(timeTravelDiv.parentNode); -->


2. That drawing of Pikachu is really cute. Let’s duplicate it using cloneNode() and insert it at the bottom of the .portfolio-container using insertAdjacentHTML() or appendChild().

var pikachuImage = document.querySelector('.portfolio-image#right-image img');
var dupPikachuImage = pikachuImage.cloneNode(true);
var portfolioContainer = document.querySelector('.portfolio-container');
portfolioContainer.appendChild(dupPikachuImage);


3. Wow, that was so satisfying I think we should do it 10 more times. Use a for loop to help you do this.

let portfolioContainer = document.querySelector('.portfolio-container');
let pikachuImage = document.querySelector('.portfolio-image#right-image img');
for (let i = 1; i <= 10; i++) {
  let dupPikachuImage = pikachuImage.cloneNode(true);
  portfolioContainer.appendChild(dupPikachuImage);
}

4. Let’s add a message about when the page was last updated. We'll do this by appending a new <li> element to the <ul> in the sidebar (you might need to refresh the page to bring back the list items that we emptied out earlier).
<!--
<aside class="highlight">

  <ul class="bio-info">
    <li class="bio-info-item">
      <span class="bio-info-title">Name</span>
      <span class="bio-info-value bio-info-name">Panda The Bear</span>
    </li> -->


const listItem = document.createElement('li');
listItem.classList.add('bio-info-item');

const leftSpan = document.createElement('span');
leftSpan.classList.add('bio-info-title');

const rightSpan = document.createElement('span');
rightSpan.classList.add('bio-info-value');
rightSpan.classList.add('bio-info-time');

var lastUpdated = document.createTextNode('Page last updated on');
var dateTextNode = document.createTextNode(new Date());
leftSpan.appendChild(lastUpdated);
rightSpan.appendChild(dateTextNode);

listItem.appendChild(leftSpan);
listItem.appendChild(rightSpan);

var bioInfo = document.querySelector('.bio-info');
bioInfo.append(listItem);
