# Lingvo

    Lingvo - easy helper in learning english words

## Installation

    $ gem install lingvo

## Usage
First you need parse some LinguaLeo word print page.

Options:

  > `--parse file`  - parse lingovleo HTML file with words

  > `--rand count`  - show 'n' random records

  > `--nitify`      - send show word - translation with your notification

  > `--gui`         - show words in simpe window

  >                 key:  n - show next word

  >                       q - close window

  > `--size`        - show words count

  > `-h`            - show this help

Setup as cronjob:

`*/5 * * * * lingvo --notify`
`*/7 * * * * env DISPLAY=:0 lingvo --gui`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
