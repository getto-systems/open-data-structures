# open-data-structures

[Open Data Structures](https://opendatastructures.org/)([japanese](https://sites.google.com/view/open-data-structures-ja/home)) practices


###### Table of Contents

- [Requirements](#Requirements)
- [Usage](#Usage)
- [License](#License)

<a id="Requirements"></a>
## Requirements

- ruby : 2.6.2


<a id="Usage"></a>
## Usage

data structure classes

- `lib/chapterN/{data_structure}.rb`
- `test/chapterN/{data_structure}_test.rb`

stat scripts

- `src/chapterN/{data_structure}_stat.rb`

### tests

```
$ rake test
```


### statistics

```
$ ruby -Ilib src/chapterN/{data_structure}_stat.rb
```


<a id="License"></a>
## License

open-data-structure is licensed under the [MIT](LICENSE) license.

Copyright &copy; since 2018 shun@getto.systems
