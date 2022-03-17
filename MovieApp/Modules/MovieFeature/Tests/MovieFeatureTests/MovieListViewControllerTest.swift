//
//  MovieListViewControllerTest.swift
//  MovieIOSTests
//
//  Created by Tifo Audi Alif Putra on 12/03/22.
//

import XCTest
@testable import MovieFeature

class MovieListViewControllerTest: XCTestCase {
    
    func test_listMoviesViewController_shouldLoadCollectionView() {
        XCTAssertNotNil(createSUT().collectionView)
    }
    
    func test_whenViewDidLoad_shouldRenderNavbarTitle() {
        XCTAssertEqual(createSUT().title, "Popular Movies")
    }
    
    func test_whenViewDidLoad_shouldAskDelegateToFetchMovies() {
        let delegate = MovieListDelegateSpy()
        _ = createSUT(delegate: delegate)
        XCTAssertTrue(delegate.fetchMoviesCalled)
    }
    
    func test_whenFailFetchMovies_shouldRenderEmptyData() {
        let delegate = MovieListDelegateSpy()
        let sut = createSUT(delegate: delegate)
        delegate.completionHandler?([], ErrorViewModel(title: "Some Error", description: "Some Description Error"))
        XCTAssertEqual(sut.collectionView.numberOfItems(inSection: 0), 0)
    }
    
    func test_whenSuccessFetchMovies_shouldRenderCorrectData() {
        let delegate = MovieListDelegateSpy()
        let sut = createSUT(delegate: delegate)
        
        delegate.completionHandler?([MovieViewModel(title: "Iron Man", posterURL: "www.ironman.poster.com", selection: {})], nil)
        
        XCTAssertEqual(sut.collectionView.numberOfItems(inSection: 0), 1)
        XCTAssertEqual(sut.collectionView.title(at: 0), "Iron Man")
    }
    
    func test_whenSelectCell_shouldExecuteItemSelection() {
        let delegate = MovieListDelegateSpy()
        let sut = createSUT(delegate: delegate)
        var selectionCalled = false
        
        delegate.completionHandler?([MovieViewModel(title: "Iron Man", posterURL: "www.ironman.poster.com", selection: {
            selectionCalled = true
        })], nil)
        
        sut.collectionView.select(at: 0)
        XCTAssertTrue(selectionCalled)
    }
    
    func test_whenCellPrepareToReuse_shouldSetImageToNil() {
        let delegate = MovieListDelegateSpy()
        let sut = createSUT(delegate: delegate)
        
        delegate.completionHandler?([
            MovieViewModel(
                title: "Iron Man",
                posterURL: "www.ironman.poster.com",
                selection: {}
            )
        ], nil)
        
        let cell = sut.collectionView.dataSource?.collectionView(sut.collectionView, cellForItemAt: .init(row: 0, section: 0)) as! MovieCell
        cell.prepareForReuse()
        
        XCTAssertNil(cell.movieThumbnail.image)
    }
    
    // MARK: Helper
    func createSUT(delegate: MovieListDelegate = MovieListDelegateSpy()) -> MovieListViewController {
        let sut = MovieListViewController(delegate: delegate)
        sut.loadViewIfNeeded()
        return sut
    }
}

private extension UICollectionView {
    
    func title(at index: Int) -> String {
        let cell = dataSource?.collectionView(self, cellForItemAt: .init(row: index, section: 0)) as! MovieCell
        return cell.movieTitle.text!
    }
    
    func select(at index: Int) {
        let indexPath = IndexPath(item: index, section: 0)
        selectItem(at: indexPath, animated: false, scrollPosition: .top)
        delegate?.collectionView?(self, didSelectItemAt: indexPath)
    }
}
