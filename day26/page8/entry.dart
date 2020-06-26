const List<Entry> dataList = <Entry>[
  Entry(
    'Buku-buku Sastra',
    <Entry>[
      Entry(
        'Buku Novel',
        <Entry>[
          Entry('Don Quixote From La Mancha'),
          Entry('100 Hundred Solitude')
        ]
      ),
      Entry('Buku Puisi'),
      Entry('Buku Kumcer'),
    ],
  ),
  Entry(
    'Buku Pemrogramman',
    <Entry>[
      Entry('Laravel & VueJs Advanced'),
      Entry('Clean Code')
    ]
  ),
  Entry(
    'Buku Sains',
    <Entry>[
      Entry('Matematika Terapan 1'),
      Entry('Sains & Teknologi')
    ]
  )
];

class Entry{
  const Entry(this.title,[this.children = const <Entry>[]]);
  final String title;
  final List<Entry> children;
}
// rafikbojes, 11:34 PM 26/06/2020