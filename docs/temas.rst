# Temas do IDGX

## 1. Temas existentes

Os temas do portal IDGX são derivações do tema padrão do Plone, o Barceloneta. Apesar de visualmente diferentes, utilizam o HTML e XML do Barceloneta, bem como boa parte de seus estilos.

### 1.1 Tema Padrão
Tema baseado na Identidade atual dos Portais do Governo Federal.
Possui um cabeçalho branco e o azul como cor principal.

![Tema Padrão](images/TemaPadraoIDGX.png)


## 2. Estrutura dos temas

O IDGX segue utilizando o Webpack para o desenvolvimento de seus temas. O Pacote de temas fica separado, no repositório [idgx.temas](https://github.com/forcontent/idgx.temas)

A estrutura de temas é bastante simples, como você pode ver nesta representação da estrutura de pastas que se encontra em webpack/app:

- css (arquivos less para cada área do portal)
- fontello (fonte de icones do UDGX, baseada no fontawsome)
- fonts (fontes disponíveis para o tema)
- img (pasta para imagens gerais do tema)
- js (arquivos js para elementos diversos)
- padrão (arquivos específicos do tema padrão)
	+ idgxtemas.less (arquivo com as variaveis e códigos css)
	+ manifest.cfg (configurações do tema)
	+ preview.png (imagem de preview do tema)
- idgxtemas.js (arquivo JS comum aos temas)
- index.html (arquivo HTML comum aos temas)
- rules.xml (arquivo XML comum aos temas)



## 3. Novos temas

todo
