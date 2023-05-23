// Arrays

// ---------- Como Criar um Array?

let arr = ['Dyegho', 36, 2.00, true]
//console.log(arr)

// ---------- Como acessar os elementos do array

//console.log('O Primeiro elemento:', arr[0])

// ----------como obter o tamanho do array

//console.log(arr.length)

// ---------- Percorrendo Array

for (let i = 0; i < arr.length; i++) {
  //console.log('Atributo do Array',arr[i])
}

for (let elemento of arr) {
  // console.log('Este eh o Elemento',elemento)
}

for (let indice in arr) {
  // console.log(indice, arr[indice])
  // Percorre o Indice do Array
}

arr.forEach(elemento => {
  // console.log('Este eh forEach ',elemento)

});

// ------------------------------------------------ METODOS DE ARRAYS

let arr1 = [30, 12, 45, 34, 29]
let arr2 = []


// ---------- Fatiamento: Slice

// Pega valores do 0 ate o 2...o 3 eh EXCLUSIVO
console.log(arr1.slice(0, 3))

//Pega valores do 3 ateh o final, o 3 eh INCLUSIVO
console.log(arr1.slice(3))

console.clear()

// ----------Adicionando elementos: push | unshift

console.log('Antes de adicionar:', arr2)

arr2.push(10, 20, 30)
arr2.unshift(40)

console.log('Depois de adicionar:', arr2)

console.clear()

// ----------Removendo elementos : pop | shift
console.log('\n')
console.log('--------------------')
console.log('Antes de remover com o PoP:', arr2)
const elementoRemovido = arr2.pop()
console.log('Depois de remover com o PoP:', arr2)
console.log('O elemento Removido foi:', elementoRemovido)
console.log('--------------------')
console.log('Antes de remover com o SHIFT:', arr2)
const elementoRemovido2 = arr2.shift()
console.log('Depois de remover com o SHIFT:', arr2)
console.log('O elemento Removido foi:', elementoRemovido2)
console.log('--------------------\n')
console.clear()

// ----------Concatenando arrays: concat
console.log('\n')
console.log('--------------------')
console.log('Array 1:', arr1)
console.log('Array 2:', arr2)

console.log('Array 1 Concatenado:',arr1.concat(arr2))
console.log('Array 2 Concatenado:',arr2.concat(arr1))

console.log('--------------------\n')
console.clear()

// ----------Buscando elementos :indexOf | lastIndexOf
console.clear()
console.log('\n')
console.log('--------------------')

let indiceDoElemento34 = arr1.indexOf(34)
console.log(indiceDoElemento34)

let arr3 = [1,2,3,3,5,3]

console.log(arr3.indexOf(3))

console.log(arr3.lastIndexOf(3))

console.log('--------------------\n')

console.clear()

// ----------Descobrindo a existencia de um elemento: includes

console.log('\n')
console.log('--------------------')
console.log('Array 1:',arr1)
console.log(arr1.includes(10))
console.log('--------------------\n')


// ----------Invertendo arrays: reverse 
console.log('\n')
console.log('--------------------')
console.log('Array 1:',arr1)
const arr1Invertido = arr1.reverse()
console.log('Array 1 invertido:', arr1Invertido)

console.log('--------------------\n')

