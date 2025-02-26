use dep::aztec::{
    note::{
        note_header::NoteHeader,
        note_interface::NoteInterface,
    },
    hash::pedersen_hash,
    context::PrivateContext,
};

global FIELD_NOTE_LEN: Field = 1;

// A note which stores a field and is expected to be passed around using the `addNote` function.
// WARNING: This Note is not private as it does not contain randomness and hence it can be easy to perform preimage
// attack on it.
struct FieldNote {
    value: Field,
    header: NoteHeader,
}

impl FieldNote {
    pub fn new(value: Field) -> Self {
        FieldNote {
            value,
            header: NoteHeader::empty(),
        }
    }

    pub fn serialize(self) -> [Field; FIELD_NOTE_LEN]{
        [self.value]
    }

    pub fn deserialize(preimage: [Field; FIELD_NOTE_LEN]) -> Self {
        FieldNote {
            value: preimage[0],
            header: NoteHeader::empty(),
        }
    }

    pub fn compute_note_hash(self) -> Field {
        // TODO(#1205) Should use a non-zero generator index.
        pedersen_hash(self.serialize(), 0)
    }

    pub fn compute_nullifier(self) -> Field {
        // This note is expected to be shared between users and for this reason can't be nullified using a secret.
        0
    }

    pub fn set_header(&mut self, header: NoteHeader) {
        self.header = header;
    }
}

fn deserialize(preimage: [Field; FIELD_NOTE_LEN]) -> FieldNote {
    FieldNote::deserialize(preimage)
}

fn serialize(note: FieldNote) -> [Field; FIELD_NOTE_LEN]{
    note.serialize()
}

fn compute_note_hash(note: FieldNote) -> Field {
    note.compute_note_hash()
}

fn compute_nullifier(note: FieldNote) -> Field {
    note.compute_nullifier()
}

fn get_header(note: FieldNote) -> NoteHeader {
    note.header
}

fn set_header(note: &mut FieldNote, header: NoteHeader) {
    note.set_header(header);
}

fn broadcast(context: &mut PrivateContext, slot: Field, note: FieldNote) {
    assert(false, "FieldNote does not support broadcast. Add it to PXE directly using the `.addNote` function.");
}

global FieldNoteMethods = NoteInterface {
    deserialize,
    serialize,
    compute_note_hash,
    compute_nullifier,
    get_header,
    set_header,
    broadcast,
};
