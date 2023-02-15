# Box Model

- Fundamental para fazer layouts para a web
- Maior facilidade para aplicar o CSS

# O que é?

Um caixa retangular.
Essa caixa possui propriedades de uma caixa (2D)

- Tamanho (largura x altura) width | height
- Conteúdo content
- Bordas border
- Preenchimento interno padding
- Espaços fora da caixa margin

* Cada elemento na sua página será considerado uma caixa.\*

## box sizing

Como será calculado o tamanho total da caixa?

- content-box|border-box

```css
div {
  box-sizing: border-box;
}
```

## display: block vs display: inline

- Como as caixas se comportam em relação às outras caixas
- Comportamento externo das caixas

| **block **                        | \*inline                        |
| --------------------------------- | ------------------------------- |
| Ocupa toda a linha, colocando o   | Elemento ao lado do outro       |
| próximo elemento abaixo desse     |                                 |
| --------------------------------- | ------------------------------- |
| width e height são respeitados    | width e height não funcionam    |
| --------------------------------- | ------------------------------- |
| padding, margin, border irão      | Somente valores horizontais de  |
| funcionar normalmente.            | margin, padding e border        |
| --------------------------------- | ------------------------------- |

exemplos
block: `<p> <div> <section>`, todos os headings `<h1> <h2>...`
inline: `<a> <strong> <span> <em>`

## margin

Espaços entre os elementos

- margin-top | margin-right | margin-bottom | margin-left
- values: `<length>` | `<percentage>` | alto

```css
div {
  /*shorthand */
  margin: 12px 16px 10px 4px;
  margin: 12px 16px 0;
  margin: 8px 16px;
  margin: 8px;
}
```

- Cuidado com margin collapsing (top se ajunta ao bottom)

## padding

Preenchimento interno da caixa

- padding-top | padding-right | padding-bottom | padding-left
- values: `<length>` | `<percentage>`

```css
div {
  /*shorthand */
  padding: 12px 16px 10px 4px;
  padding: 12px 16px 0;
  padding: 8px 16px;
  padding: 8px;
}
```

- Padding poderá causar diferença na largura de um elemento
