//
//  ActivityView.swift
//  Minus1
//
//  Created by Max on 09.10.2024.
//

import SwiftUI

struct ActivityView: View {
    @StateObject private var viewModel = ActivityViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                Color.darkSky
                    .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    categoryActivitiesSection
                    recentActivitiesSection
                }
                .applyToolbar()
            }
        }
    }
    
    // MARK: - Category Activities Section
    private var categoryActivitiesSection: some View {
        VStack(alignment: .leading) {
            ForEach(viewModel.activitiesCategory.indices, id: \.self) { index in
                categoryButton(for: index)
            }
        }
        .padding(.vertical, 30)
    }
    
    private func categoryButton(for index: Int) -> some View {
        Button {
            viewModel.selectedIndex = index
        } label: {
            HStack {
                Image(viewModel.activitiesCategoryIcon[index])
                Text(viewModel.activitiesCategory[index])
                    .padding(.leading)
                
                Spacer()
                
                Image(.arrowGrayRight)
            }
            .foregroundStyle(Color.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(Font.orbitronRegular14)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(Color.darkBackgroundColor))
            .padding(.horizontal)
        }
    }
    
    // MARK: - Recent Activities Section
    private var recentActivitiesSection: some View {
        VStack(alignment: .leading) {
            Text("Recent Activity")
                .font(Font.soraBold20)
                .foregroundStyle(Color.white)
            
            ScrollView(showsIndicators: false) {
                VStack {
                    ForEach(viewModel.activities.indices, id: \.self) { index in
                        recentActivityRow(for: index)
                    }
                }
            }
        }
        .padding(.vertical)
        .padding(.horizontal)
    }
    
    private func recentActivityRow(for index: Int) -> some View {
        let activity = viewModel.activities[index]
        
        return VStack {
            Divider()
                .overlay(Color.gray.opacity(0.4))
            
            HStack {
                statusCircle(for: activity.status)
                
                VStack(alignment: .leading) {
                    Text(activity.symbol)
                        .foregroundStyle(Color.white)
                        .font(Font.orbitronBold15)
                    
                    activityDetailsSection
                }
                
                Spacer()
                
                activitySummarySection(for: activity)
            }
            .padding(.vertical)
        }
    }
    
    // MARK: - Helper Views for Recent Activities
    private var activityDetailsSection: some View {
        VStack(alignment: .leading) {
            Text("Amount")
            Text("Price")
            Text("Status")
        }
        .padding(.vertical, 5)
        .foregroundStyle(Color.gray)
        .font(Font.orbitronRegular12)
    }
    
    private func statusCircle(for status: String) -> some View {
        ZStack {
            Circle()
                .frame(width: 40)
                .foregroundStyle(status == "Filled" ? Color.green.opacity(0.1) : Color.red.opacity(0.1))
            Text(status == "Filled" ? "L/B" : "L/S")
                .foregroundStyle(status == "Filled" ? Color.greenGrassColor : Color.red)
                .font(Font.soraRegular15)
        }
        .padding(.bottom, 45)
    }
    
    private func activitySummarySection(for activity: ActivityInfoModel) -> some View {
        VStack(alignment: .trailing) {
            HStack {
                Text(activity.activityDate)
                    .foregroundStyle(Color.gray)
                    .font(Font.soraRegular12)
                
                Image(.arrowGrayRightUn)
            }
            .padding(.vertical, 5)
            
            HStack {
                Text("\(activity.amount)/")
                    .foregroundStyle(Color.greenGrassColor)
                    .font(Font.soraRegular15)
                
                Text("\(activity.amount)")
                    .foregroundStyle(Color.lightGrayColor)
                    .font(Font.soraRegular15)
            }
            
            Text("\(String(format: "%.2f", activity.price))")
                .foregroundStyle(Color.lightGrayColor)
                .font(Font.soraRegular15)
            
            Text(activity.status)
                .foregroundStyle(activity.status == "Filled" ? Color.greenGrassColor : Color.red)
                .font(Font.soraRegular15)
        }
    }
}

#Preview {
    ActivityView()
}
