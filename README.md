<p align="center">
  <img src="https://imgur.com/iDDgLOk.png" width="360">
</p>

<div align="center">

# SwiggyClone

### A pixel-faithful iOS clone of Swiggy built with UIKit and UICollectionViewCompositionalLayout

[![Stars](https://img.shields.io/github/stars/dheerajghub/SwiggyClone?style=for-the-badge&color=FA7343)](https://github.com/dheerajghub/SwiggyClone/stargazers)
[![Forks](https://img.shields.io/github/forks/dheerajghub/SwiggyClone?style=for-the-badge&color=0D96F6)](https://github.com/dheerajghub/SwiggyClone/network/members)
[![Platform](https://img.shields.io/badge/platform-iOS-orange?style=for-the-badge)](https://developer.apple.com/ios/)
[![Swift](https://img.shields.io/badge/Swift-FA7343?style=for-the-badge&logo=swift&logoColor=white)](https://developer.apple.com/swift/)
[![UIKit](https://img.shields.io/badge/UIKit-0D96F6?style=for-the-badge&logo=apple&logoColor=white)](https://developer.apple.com/documentation/uikit)

</div>

---

## About

SwiggyClone is an iOS application that faithfully recreates the Swiggy food delivery app UI. The primary goal is to master `UICollectionViewCompositionalLayout` — Apple's modern, declarative layout engine — by using it to build Swiggy's complex, multi-section home feed with mixed layout types all within a single collection view.

This project is a hands-on deep dive into:
- `UICollectionViewCompositionalLayout` — orthogonal scrolling, nested groups, decorations
- `UICollectionViewDiffableDataSource` — snapshot-based, type-safe data management
- Custom `UICollectionViewCell` design with Auto Layout
- Multi-section feeds with heterogeneous layouts
- UIKit best practices for complex, production-grade screens

---

## Tech Stack

| Layer | Technology |
|:---|:---|
| Language | Swift |
| UI Framework | UIKit |
| Layout Engine | `UICollectionViewCompositionalLayout` |
| Data Source | `UICollectionViewDiffableDataSource` |
| Build Tool | Xcode |
| CI | GitHub Actions |

---

## Repository Structure

```
SwiggyClone/
│
├── SwiggyClone.xcodeproj/          ← Xcode project file
│   └── project.pbxproj
│
├── SwiggyClone/                    ← Main source directory
│   ├── AppDelegate.swift
│   ├── SceneDelegate.swift
│   │
│   ├── Controllers/                ← View Controllers
│   │   └── HomeViewController.swift
│   │
│   ├── Views/                      ← Custom cells & reusable views
│   │   ├── Cells/
│   │   └── Headers/
│   │
│   ├── Models/                     ← Data models
│   │
│   ├── Resources/                  ← Assets, fonts, colors
│   │   └── Assets.xcassets
│   │
│   └── Supporting Files/
│       └── Info.plist
│
├── .github/
│   └── workflows/                  ← GitHub Actions CI config
│
└── README.md
```

> **Note:** The source folder structure above reflects the standard UIKit project layout. Explore the [`SwiggyClone/`](https://github.com/dheerajghub/SwiggyClone/tree/main/SwiggyClone) directory on GitHub for the exact file list.

---

## Getting Started

### Requirements
- Xcode 14+
- iOS 14+ deployment target
- Swift 5.7+

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/dheerajghub/SwiggyClone.git

# 2. Open in Xcode
cd SwiggyClone
open SwiggyClone.xcodeproj
```

3. Select a simulator or connected device
4. Hit **Cmd + R** to build and run

No external dependencies or package managers required — pure UIKit, zero setup friction.

---

## Screenshots

| | |
|:---:|:---:|
| <img src="https://imgur.com/X9Kruvj.png" height="420"> | <img src="https://imgur.com/7dcfmsL.png" height="420"> |
| <img src="https://imgur.com/JjYsdy0.png" height="420"> | <img src="https://imgur.com/wNL1lJl.png" height="420"> |
| <img src="https://imgur.com/XLsN0QX.png" height="420"> | <img src="https://imgur.com/OuwM8Wy.png" height="420"> |
| <img src="https://imgur.com/52GtJmw.png" height="420"> | <img src="https://imgur.com/POAtuHf.png" height="420"> |
| <img src="https://imgur.com/UaKzfg3.png" height="420"> | <img src="https://imgur.com/oiIBeqc.png" height="420"> |
| <img src="https://imgur.com/wBK57gW.png" height="420"> | <img src="https://imgur.com/iuCsiVq.png" height="420"> |

---

## Key Concepts Covered

**UICollectionViewCompositionalLayout** — the backbone of the entire UI. Each section of the feed is built with a distinct layout — horizontal carousels, grid-style cards, banner-sized items — all composed declaratively and rendered in a single collection view.

**DiffableDataSource** — snapshot-based updates for smooth, animation-friendly data changes without manual `reloadData()` calls.

**Orthogonal Scrolling** — sections that scroll independently in a direction different from the main feed (e.g., horizontally scrolling restaurant chips inside a vertically scrolling feed).

**Supplementary Views** — section headers and footers that pin, scroll, or float using compositional layout's boundary supplementary items.

---

## Support

If this project helped you learn something new, a ⭐️ on the repo goes a long way!

For questions or issues, reach out at **dheerajsh123456@gmail.com**

[![Buy Me a Coffee](https://img.shields.io/badge/Buy%20Me%20a%20Coffee-%23FFDD00.svg?style=for-the-badge&logo=buy-me-a-coffee&logoColor=black)](https://buymeacoffee.com/dheeraj.iosdev)

---

<div align="center">
  <sub>© Dheeraj Kumar Sharma · 2026</sub>
</div>
