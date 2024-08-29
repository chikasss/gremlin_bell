// import { Controller } from "@hotwired/stimulus"
// import debounce from "lodash.debounce"

// export default class extends Controller {
//   static targets = ["input", "results"]

//   connect = () => {
//     this.query = ""
//     this.search = debounce(this.search, 300)
//   }

//   onInput = (event) => {
//     this.query = event.target.value
//     const mentionStart = this.query.lastIndexOf('@')
//     if (mentionStart !== -1 && this.query.length > mentionStart + 1) {
//       const query = this.query.slice(mentionStart + 1)
//       this.search(query)
//       this.resultsTarget.classList.remove('d-none');
//     } else {
//       this.resultsTarget.innerHTML = ""
//       this.resultsTarget.classList.add('d-none');
//     }
//   }

//   search = (query) => {
//     fetch(`/mentions/search?query=${query}`)
//       .then(response => response.json())
//       .then(data => {
//         this.resultsTarget.innerHTML = this.renderResults(data)
//       })
//   }

//   renderResults = (results) => {
//     return results.map(result => 
//       `<li data-action="click->mentions#selectMention" data-name="${result.name}">
//         ${result.name}
//       </li>`
//     ).join("")
//   }

//   selectMention = (event) => {
//     const mention = event.currentTarget.dataset.name;
//     const mentionStart = this.query.lastIndexOf('@');

//     if (mentionStart !== -1) {
//       const beforeMention = this.query.slice(0, mentionStart);

//       if (mention.includes(' ')) {
//         this.query = beforeMention + `@[${mention}]`; // add [] on routes mentions
//       } else {
//         this.query = beforeMention + `@${mention}`; // user mention without []
//       }

//       this.inputTarget.value = this.query;
//       this.resultsTarget.innerHTML = "";
//       this.resultsTarget.classList.add('d-none');
//     }
//   };


//   beforeSubmit = () => {
//     let content = this.inputTarget.value;
//     this.inputTarget.value = content;
//   }
// }


import { Controller } from "@hotwired/stimulus"
import debounce from "lodash.debounce"

export default class extends Controller {
  static targets = ["input", "results", "hiddenInput"]

  connect() {
    this.query = ""
    this.rawContent = this.inputTarget.value;
    this.search = debounce(this.search.bind(this), 300)
  }

  onInput(event) {
    this.query = event.target.value
    const mentionStart = this.query.lastIndexOf('@')
    if (mentionStart !== -1 && this.query.length > mentionStart + 1) {
      const query = this.query.slice(mentionStart + 1)
      this.search(query)
      this.resultsTarget.classList.remove('d-none');
    } else {
      this.resultsTarget.innerHTML = ""
      this.resultsTarget.classList.add('d-none');
    }
  }

  search(query) {
    fetch(`/mentions/search?query=${query}`)
      .then(response => response.json())
      .then(data => {
        this.resultsTarget.innerHTML = this.renderResults(data)
      })
  }

  renderResults(results) {
    return results.map(result => 
      `<li data-action="click->mentions#selectMention" data-name="${result.name}">
        ${result.name}
      </li>`
    ).join("")
  }

  selectMention(event) {
    const mention = event.currentTarget.dataset.name;
    const mentionStart = this.query.lastIndexOf('@');
    const beforeMention = this.query.slice(0, mentionStart);

    if (mention.includes(' ')) {
      this.query = beforeMention + `@${mention}`; // Exibe sem colchetes na view
      this.rawContent += ` @[${mention}]`; // Adiciona colchetes no rawContent
    } else {
      this.query = beforeMention + `@${mention}`; // Apenas adiciona a menção do usuário sem colchetes
      this.rawContent += ` @${mention}`;
    }

    this.inputTarget.value = this.query;
    this.resultsTarget.innerHTML = "";
    this.resultsTarget.classList.add('d-none');
  }

  beforeSubmit() {
    // Adiciona os colchetes rapidamente antes do envio
    this.inputTarget.value = this.rawContent.trim();
    this.hiddenInputTarget.value = this.rawContent.trim();
  }
}
