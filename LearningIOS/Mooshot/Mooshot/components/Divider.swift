//
//  Divider.swift
//  Mooshot
//
//  Created by Borges on 27/06/24.
//

import SwiftUI

struct Divider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.white.opacity(0.4))
            .padding(.vertical)
    }
}

#Preview {
    Divider().preferredColorScheme(.dark)
}
