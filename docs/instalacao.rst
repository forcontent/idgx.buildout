# Instalação do IDGX

Instruções de instalação do Portal IDGX.

## 1. Ambiente de Desenvolvimento
Segue abaixo as instruções de instalação do Portal IDGX para avaliação e desenvolvimento.

Fiquem atentos as instruções para a versão de Python correta. APesar do Objetivo do IDGX seja a utilização de Python 3, ainda seguimos utilizando python 2.7 no momento.

As instruções são para a instalação em um ambiente Linux.

### 1.1 Dependências
Atualize o sistema com as dependências necessárias. Na linha de comando rode:


```
$ sudo apt-get update && sudo apt-get install -y --no-install-recommends --no-install-suggests python3-setuptools python3-dev build-essential python3-cffi libpcre3-dev libssl-dev libxml2-dev libxslt1-dev libbz2-dev libjpeg62-dev libyaml-dev curl tzdata net-tools python3-venv
```

Se usado Python2.7 então instale os pacotes.

```
$ sudo apt-get update && sudo apt-get install -y --no-install-recommends --no-install-suggests python-setuptools python2-dev build-essential python-cffi libpcre3-dev libssl-dev libxml2-dev libxslt1-dev libbz2-dev libjpeg62-dev libyaml-dev curl tzdata net-tools
```

### 1.2 Ambiente Virtual

Para evitar conflitos com o Python utilizado pelo sistema operacional, cria-se um ambiente virtual (virtualenv) apartado do restante do sistema. Execute:

```
virtualenv -p python2.7 ./env27
```

Atenção: Por enquanto seguimos com Python 2.7 para agilizar o desenvolvimento. Quando finalizado, utilizaremos Python 3:

```
python3 -m venv env
```

Agora clone o projeto:

```
$ git clone https://github.com/forcontent/idgx.buildout.git
```

Ative o ambiente virtual:

```
$ source ./env/bin/activate
```


### 1.3 Buildout

Para terminar, vá para a pasta onde o código do projeto foi clonado, instale os requerimentos e rode o buildout:

```
$ cd idgx.buildout
$ pip install -r requirements.txt
$ buildout -t 30 -c development.cfg
```

"Nada pode dar errado" (Santos, Cléber)

### 1.4 Subindo a instancia

Para subir a instancia e iniciar o Plone rode: 

```
$ bin/instance fg
```

Você poderá acessar o Plone pelo endereço localhost:8080 em seu navegador

## Ambiente de Produção

todo

## Container

todo