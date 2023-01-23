//Define super class for all cloud exceptions
class CloudStorageException implements Exception {
  const CloudStorageException();
}

//create related exception
class CouldNotCreateNoteExceptions extends CloudStorageException {}

//read related exception
class CouldNotGetAllNotesException extends CloudStorageException {}

//update related exception
class CouldNotUpdateNoteExceptions extends CloudStorageException {}

//delete related exception
class CouldNotDeleteNoteExceptions extends CloudStorageException {}
