# Instalação do IDGX

Instruções de instalação do Portal IDGX.

## 1. Ambiente de Desenvolvimento
Segue abaixo as instruções de instalação do Portal IDGX para avaliação e desenvolvimento.

Fiquem atentos as instruções para a versão de Python correta. Apesar do Objetivo do IDGX seja a utilização de Python 3, ainda seguimos utilizando python 2.7 no momento.

As instruções são para a instalação em um ambiente Linux Ubuntu 20.04.

### 1.1 Dependências
Atualize o sistema com as dependências necessárias. Na linha de comando rode:

```
$ sudo apt-get update && sudo apt-get install -y --no-install-recommends --no-install-suggests python-setuptools python2-dev build-essential python-cffi libpcre3-dev libssl-dev libxml2-dev libxslt1-dev libbz2-dev libjpeg62-dev libyaml-dev curl tzdata net-tools libgdk-pixbuf2.0-dev
```

### 1.2 Ambiente Virtual

Para evitar conflitos com o Python utilizado pelo sistema operacional, cria-se um ambiente virtual (virtualenv) apartado do restante do sistema. 
Caso necessário, instale o virtualenv:

```
sudo apt install virtualenv
```

Para criar o ambiente virtual execute:

```
virtualenv -p python2.7 ./env27
```

Agora clone o projeto:

```
$ git clone https://github.com/forcontent/idgx.buildout.git
```

Ative o ambiente virtual:

```
$ source ./env27/bin/activate
```


### 1.3 Buildout

Para terminar, vá para a pasta onde o código do projeto foi clonado, instale os requerimentos e rode o buildout:

```
$ cd idgx.buildout
$ pip install -r requirements/install.txt
$ buildout -t 30 -c development.cfg
```

"Nada pode dar errado" (Santos, Cléber)

### 1.4 Subindo a instancia

Para subir a instancia e iniciar o Plone rode: 

```
$ bin/instance fg
```

Você poderá acessar o Plone pelo endereço http://localhost:8080 em seu navegador.

## 2. Ambiente de Avaliação

Para criar um ambiente de avaliação do IDGX você pode serguir os mesmos passos da seção anterior até o passo 1.2. A única mudança a ser feita será na hora de rodar o buildout e subir a instancia.

### 2.1 Buildout

Para avaliação, você irá rodar um arquivo de buildout diferente, o buildout.cfg:

```
$ cd idgx.buildout
$ pip install -r requirements/install.txt
$ buildout -t 30 -c buildout.cfg
```

### 2.2 Subindo a instancia

Para subir a instancia, não será necessário subir em modo foreground. Entao para iniciar o Plone rode: 

```
$ bin/instance start
```

Você poderá acessar o Plone pelo endereço http://localhost:8080 em seu navegador

## Ambiente de Produção

todo

## Container

todo
