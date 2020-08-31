from pygments.lexer import RegexLexer, include, bygroups, default, using, this
from pygments.style import Style
from pygments.token import *

class MLIRLexer(RegexLexer):
    name = 'MLIR'
    aliases = ['mlir']
    filenames = '*.mlir'

    tokens = {
        'literals': [
            (r'".*?"', String),                                                 # Strings constants
            (r'0x[0-9a-fA-F]+', Number.Hex),                                    # Hex constants
            (r'(\d+)(s|ms|ns|ps|d|e)?', bygroups(Number.Integer, Text)),        # Integer constants
            (r'[=:]|->', Operator),                                             # Operatiors
            (r'[,\(\)\{\}\[\]<>.]', Punctuation),                                # Punctuation
            (r'\s+', Text),
        ],
        'comments': [
            (r'//.*?$', Comment.Single),                                        # Comments
        ],
        'types': [
            (r'tuple|i[1-9][0-9]*', Keyword.Type),                              # Standard MLIR types
            (r'!', Keyword.Type, 'customtype'),                                 # Custom MLIR types
            (r'(<)(.*?)(>)', bygroups(using(this), using(this), using(this))),  # Nested types
            (r'[\$\*]', Keyword.Type),                                          # LLHD extra types
        ],
        'attributes': [
            (r'dense', Keyword),                                                # MLIR standard attributes
            (r'#', Keyword, 'customattribute'),                                 # MLIR custom attributes
        ],
        'root': [
            include('types'),
            include('attributes'),
            include('comments'),
            include('literals'),
            (r'\w+\.?[\w\.]+', Keyword.Reserved),                               # Operations
            (r'%[\w_][\w\d_.$]*', Name.Constant),                               # Operands
            (r'@[\w_][\w\d_.$]*', Name.Function),                               # Symbols
            (r'\^\w+', Name.Label),                                             # Block labels
        ],
        'customattribute': [
            (r'(\w+\.?[\w\.]+)(.*)', bygroups(Keyword, using(this))),
            default('root'),
        ],
        'customtype': [
            (r'(!?\w+\.?[\w\.]*)(.*)', bygroups(Keyword.Type, using(this))),
            default('root'),
        ]
    }

class MLIRStyle(Style):
    default_style = ""
    styles = {
        Comment:                'italic #888',
        Keyword:                'bold #005',
        Keyword.Type:           '#81D6EC',
        Name:                   '#f00',
        Name.Function:          '#0f0',
        Name.Class:             'bold #0f0',
        String:                 'bg:#eee #111'
    }