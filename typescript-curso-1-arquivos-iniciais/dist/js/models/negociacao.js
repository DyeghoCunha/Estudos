export class Negociacao {
    constructor(_data, quantidade, valor) {
        this._data = _data;
        this.quantidade = quantidade;
        this.valor = valor;
    }
    get data() {
        const data = new Date(this._data.getTime());
        return data;
    }
    get volume() {
        return this.quantidade * this.valor;
    }
}
//!! O CODIGO FOI ALTERADO PARA TIRAR O PRIVATE E OS GETTERS, COM OS PUBLIC READONLY VOCÊ PODE TIRAR OS _ E GETTERS
