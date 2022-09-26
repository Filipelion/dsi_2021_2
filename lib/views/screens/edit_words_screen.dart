// class BuildFormPageState extends State<BuildFormPage> {
//   var first = '';
//   var second = '';
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     Map arguments = ModalRoute.of(context).settings.arguments as Map;
//     var pair = arguments['pair'];
//     var index = arguments['index'];
//     first = pair.first;
//     second = pair.second;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit pair'),
//       ),
//       body: Container(
//         color: Colors.teal[50],
//         child: _buildForm(
//           context,
//           pair,
//           index,
//         ),
//       ),
//     );
//   }

//   Widget _buildForm(BuildContext context, WordPair pair, int index) {
//     return Form(
//       key: _formKey,
//       child: Wrap(
//         alignment: WrapAlignment.center,
//         runSpacing: 16.0,
//         children: <Widget>[
//           TextFormField(
//             initialValue: first,
//             keyboardType: TextInputType.text,
//             decoration: const InputDecoration(
//               contentPadding: EdgeInsets.all(10.0),
//               labelText: 'First',
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter some text';
//               }
//               return null;
//             },
//             onSaved: (newValue) {
//               first = newValue;
//             },
//           ),
//           TextFormField(
//             initialValue: second,
//             keyboardType: TextInputType.text,
//             decoration: const InputDecoration(
//               contentPadding: EdgeInsets.all(10.0),
//               labelText: 'Second',
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter some text';
//               }
//               return null;
//             },
//             onSaved: (value) {
//               second = value;
//             },
//           ),
//           SizedBox(
//             width: double.infinity,
//           ),
//           ElevatedButton(
//             onPressed: () => _saveNewPair(context, index, pair),
//             child: Text('Save'),
//           ),
//         ],
//       ),
//     );
//   }

//   void _saveNewPair(BuildContext context, index, pair) {
//     if (_formKey.currentState.validate()) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text(
//             'Saved',
//           ),
//         ),
//       );

//       _formKey.currentState.save();
//       setState(() {
//         var newPair = WordPair(first, second);
//         suggestions[index] = newPair;
//         if (_saved.contains(pair)) {
//           _saved.remove(pair);
//           _saved.add(newPair);
//         }
//       });
//       Navigator.pop(context, true);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Error'),
//         ),
//       );
//     }
//   }
// }
