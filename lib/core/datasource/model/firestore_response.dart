class FirestoreResponse<D, E> {
  D? data;
  E? error;
  bool get isSuccess => data != null;
  bool get isError => error != null;

  FirestoreResponse.success(this.data) : error = null;

  FirestoreResponse.error(this.error) : data = null;
}
