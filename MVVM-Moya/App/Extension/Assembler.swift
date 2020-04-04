//
//  Assembler.swift
//  CleanArchitecture
//
//  Created by Tuan Truong on 7/15/18.
//  Copyright © 2018 Sun Asterisk. All rights reserved.
//

protocol Assembler: class,
    LoginAssembler,
    RoomDetailAssembler,
    RoomMainAssembler,
    RoomHistoryAssembler,
    AppAssembler {
    
}

final class DefaultAssembler: Assembler {
    
}
