import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lookal/models/product_model.dart';

enum EditMode {
  add,
  edit,
}

class EditPostPage extends StatefulWidget {
  final ProductModel? productModel;
  final EditMode editMode;
  final String? farmerId;

  const EditPostPage({
    super.key,
    this.productModel,
    required this.editMode,
    this.farmerId,
  });

  @override
  State<EditPostPage> createState() => _EditPostPageState();
}

class _EditPostPageState extends State<EditPostPage> {
  final productsCollection = FirebaseFirestore.instance.collection('products');

  final _name = TextEditingController();
  final _price = TextEditingController();
  final _quantity = TextEditingController();
  final _unit = TextEditingController();
  final _category = TextEditingController();
  final _description = TextEditingController();

  @override
  void initState() {
    if (widget.editMode == EditMode.edit) {
      if (widget.productModel != null) {
        _name.text = widget.productModel!.name;
        _price.text = widget.productModel!.price;
        _quantity.text = widget.productModel!.quantity;
        _unit.text = widget.productModel!.unit;
        _category.text = widget.productModel!.category;
        _description.text = widget.productModel!.description!;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: const Text('Cancel'),
                    onTap: () {
                      Widget discardButton = TextButton(
                        child: const Text("Discard"),
                        onPressed: () async {
                          var nav = Navigator.of(context);
                          nav.pop();
                          nav.pop();
                        },
                      );
                      Widget cancelButton = TextButton(
                        child: Text("Cancel"),
                        onPressed: () async {
                          Navigator.of(context).pop();
                        },
                      );
                      AlertDialog alert = AlertDialog(
                        title: const Text("Discard Posting?"),
                        content:
                            const Text("You're about to discard this posting."),
                        actions: [
                          discardButton,
                          cancelButton,
                        ],
                      );

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    },
                  ),
                  Text(
                    widget.editMode == EditMode.add ? 'New Post' : 'Edit Post',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                      child: const Text('Publish'),
                      onTap: () async {
                        if (_name.text.isNotEmpty &&
                            _price.text.isNotEmpty &&
                            _quantity.text.isNotEmpty &&
                            _unit.text.isNotEmpty &&
                            _category.text.isNotEmpty) {
                          await productsCollection.add({
                            "name": _name.text,
                            "price": _price.text,
                            "quantity": _quantity.text,
                            "unit": _unit.text,
                            "category": _category.text,
                            "description": _description.text,
                            "farmer_id": widget.farmerId,
                            "image_url": null,
                          });

                          Navigator.pop(context);
                        }
                      }),
                ],
              ),
              const SizedBox(height: 32),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _name,
                        decoration: const InputDecoration(
                          hintText: 'Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _price,
                        inputFormatters: <TextInputFormatter>[
                          CurrencyTextInputFormatter(
                            locale: 'en-PH',
                            decimalDigits: 2,
                            symbol: 'Php ',
                          ),
                        ],
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'Price',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _quantity,
                        inputFormatters: <TextInputFormatter>[
                          CurrencyTextInputFormatter(
                            locale: 'en-PH',
                            decimalDigits: 2,
                            symbol: '',
                          ),
                        ],
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'Quantity',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _unit,
                        decoration: const InputDecoration(
                          hintText: 'Unit',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _category,
                        decoration: const InputDecoration(
                          hintText: 'Category',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _description,
                        decoration: const InputDecoration(
                          hintText: 'Description',
                          helperText:
                              'A detailed description might help you sell faster.',
                          border: OutlineInputBorder(),
                        ),
                        maxLines: null,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
