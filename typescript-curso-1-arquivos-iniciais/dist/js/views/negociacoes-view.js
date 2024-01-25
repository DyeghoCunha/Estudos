export class NegociacoesView {
    constructor(seletor) {
        this.elemento = document.querySelector(seletor);
    }
    template() {
        return `
  <table class= "table table-hover table-bordered">
  <thead>
   <tr>
     <th>DATA</th>
     <th>QUANTIDADE</th>
     <h>VALOR</h>
   </tr>
  </thead>
  <tbody>
  
  </tbody>
  </table>
  `;
    }
    update() {
        this.elemento.innerHTML = this.template();
    }
}
