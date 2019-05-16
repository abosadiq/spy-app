import Foundation

protocol Cipher {
    func encode(_ plaintext: String, secret: String) -> String?
    func decrypt(_ plaintext: String, secret: String) -> String?
}

struct CeaserCipher: Cipher {

    func encode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""

        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode + shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    func decrypt(_ encryptedtext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }

        var decrypted = ""

        for character in encryptedtext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode - shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decrypted = decrypted + shiftedCharacter
        }
        
        return decrypted
    }
    
}

struct AlphanumericCeasarCipher: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""
        let newplaintext = plaintext.uppercased()
        for character in newplaintext {
            
            let unicode = character.unicodeScalars.first!.value
            if (unicode < 48 || unicode > 122 || (unicode > 57 && unicode < 65) || (unicode > 90 && unicode < 97)) {
                return "Error: Input Contains Invalid Characters"
            }
            
            var shiftedUnicode = unicode + shiftBy
            
            if shiftBy > 0 && shiftedUnicode > 90 {
                shiftedUnicode = shiftedUnicode - 43
            }else if shiftBy > 0 && shiftedUnicode > 57 && shiftedUnicode < 65{
                shiftedUnicode = shiftedUnicode + 7
            }else if shiftBy < 0 && shiftedUnicode < 48 {
                shiftedUnicode = shiftedUnicode + 43
            }else if shiftBy < 0 && shiftedUnicode > 57 && shiftedUnicode < 65{
                shiftedUnicode = shiftedUnicode - 7
            }
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    func decrypt(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var decrypted = ""
        
        let newplaintext = plaintext.uppercased()
        
        for character in newplaintext {
            
            let unicode = character.unicodeScalars.first!.value
            
            var shiftedUnicode = unicode - shiftBy
            
            if shiftBy > 0 && shiftedUnicode > 90 {
                shiftedUnicode = shiftedUnicode - 43
            }else if shiftBy > 0 && shiftedUnicode > 57 && shiftedUnicode < 65{
                shiftedUnicode = shiftedUnicode + 7
            }else if shiftBy < 0 && shiftedUnicode < 48 {
                shiftedUnicode = shiftedUnicode + 43
            }else if shiftBy < 0 && shiftedUnicode > 57 && shiftedUnicode < 65{
                shiftedUnicode = shiftedUnicode - 7
            }
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decrypted = decrypted + shiftedCharacter
        }
        return decrypted
    }
}
struct ROT13Cipher: Cipher {
    func encode(_ plaintext: String, secret: String) -> String? {
        
        var encoded = ""
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode + 13
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    func decrypt(_ encryptedtext: String, secret: String) -> String? {
        
        var decrypted = ""
        
        for character in encryptedtext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode - 13
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decrypted = decrypted + shiftedCharacter
        }
        
        return decrypted
    }
}
struct Lucky7Cipher: Cipher {
    func encode(_ plaintext: String, secret: String) -> String? {
        
        var encoded = ""
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode + 7
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    func decrypt(_ encryptedtext: String, secret: String) -> String? {
        
        var decrypted = ""
        
        for character in encryptedtext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode - 7
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decrypted = decrypted + shiftedCharacter
        }
        
        return decrypted
    }
}

