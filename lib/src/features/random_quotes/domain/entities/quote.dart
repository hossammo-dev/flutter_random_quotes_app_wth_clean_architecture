import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  final String author;
  final int id;
  final String quote;
  final String permalink;

  const Quote(this.author, this.id, this.quote, this.permalink);

  @override 
  List<Object?> get props => [author, id, quote, permalink];
}